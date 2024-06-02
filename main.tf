locals {
    common_tags = {
        terraform = "true"
    }
}

#Define the AWS WAFv2 Web ACL resource
resource "aws_wafv2_web_acl" "WafWebAcl" {
    name = "wafv2-web-acl"
    scope = "REGIONAL"

    default_action {
        allow {}
    }


#Configurtion for loggin and monitoring
visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name = "WAF_Common_Protections"
    sampled_requests_enabled = true
}

rule {
    name = "AWS-AWSManagedRulesSQLiRuleSet"
    priority = 0
    override_action {
        none {}
    }

    statement {
        managed_rule_group_statement {
            name = "AWSManagedRulesSQLiRuleSet"
            vendor_name = "AWS"
        }
    }

    # Visibility configurtion specific to this rule
    visibility_config {
        cloudwatch_metrics_enabled = true 
        metric_name = "AWS_AWSManagedRulesSQLiRuleSet"
        sampled_requests_enabled = true
    }
}

    tags = merge(
        local.common_tags, {
            customer = "wafv2-web-acl"
        }
    )
} #end the rule block section


# Define a Cloudwatch log group for logging WAFv2 Web ACL activity. 
resource "aws_cloudwatch_log_group" "WafWebAclLoggroup" {
    name = "aws-waf-logs-wafv2-web-acl"
    retention_in_days = 3
}

# Define the loggging configuration for WAFv2 Web ACL
resource "aws_wafv2_web_acl_logging_configuration" "WafWebAclLogging" {
    log_destination_configs = [aws_cloudwatch_log_group.WafWebAclLoggroup.arn]
    resource_arn = aws_wafv2_web_acl.WafWebAcl.arn
    depends_on = [
        aws_wafv2_web_acl.WafWebAcl,
        aws_cloudwatch_log_group.WafWebAclLoggroup
    ]
}

# Associate the Web ACL with a resource (e.g., an AWS load balancer)
resource "aws_wafv2_web_acl_association" "WafWebAclAssociation" {
    resource_arn = var.aws_lb_arn
    web_acl_arn = aws_wafv2_web_acl.WafWebAcl.arn
    depends_on = [
        aws_wafv2_web_acl.WafWebAcl,
        aws_cloudwatch_log_group.WafWebAclLoggroup
    ]
}