# AWS WAFv2 with Managed SQL Injection Rule

This Terraform configuration sets up an AWS WAFv2 Web ACL with an AWS Managed Rule **AWSManagedRulesSQLiRuleSet** for SQL Injection (SQLi). It attaches the Web ACL to an AWS load balancer.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
- AWS account credentials configured. You can set up your credentials using the AWS CLI or through environment variables.

## Setup Instructions

1. **Clone the repository:**

    ```sh
    git clone https://github.com/imusabkhan/AWS-WAF-Terraform-Code.git
    cd AWS-WAF-Terraform-Code
    ```

2. **Set the AWS region and load balancer ARN:**

    Open the `terraform.tfvars` file and set the `region` and `aws_lb_arn` values:

    ```hcl
    region     = "ap-southeast-1"
    aws_lb_arn = "<your-load-balancer-arn>"
    ```

3. **Initialize Terraform:**

    Initialize the Terraform working directory. This will download the necessary provider plugins.

    ```sh
    terraform init
    ```

4. **Validate the configuration:**

    Validate the configuration files to ensure that there are no syntax errors or issues.

    ```sh
    terraform validate
    ```

5. **Plan the deployment:**

    Generate and review the execution plan.

    ```sh
    terraform plan
    ```

    To save the plan to a file, use:

    ```sh
    terraform plan -out=tfplan
    ```

6. **Apply the configuration:**

    Apply the configuration to create the resources. If you saved the plan to a file, use the saved plan to ensure the exact actions previewed are applied.

    ```sh
    terraform apply
    ```

    If using the saved plan:

    ```sh
    terraform apply tfplan
    ```

7. **Confirm the apply action:**

    You will be prompted to type `yes` to confirm and proceed with the apply.

## File Structure

- `main.tf`: Defines the AWS WAFv2 Web ACL and associated rules.
- `provider.tf`: Configures the AWS provider.
- `variables.tf`: Defines the input variables for the Terraform configuration.
- `terraform.tfvars`: Contains the values for the variables defined in `variables.tf`.

## Example `terraform.tfvars`

```hcl
region     = "ap-southeast-1"
aws_lb_arn = "arn:aws:elasticloadbalancing:ap-southeast-1:123456789012:loadbalancer/app/my-load-balancer/50dc6c495c0c9188"
```

## DigitalOcean Referral

If you're interested in trying out DigitalOcean for hosting your projects, you can sign up using [this referral link](https://m.do.co/c/6b4b1bf0f63e). By using this link, you'll get some free credits to start with.

[Sign up on DigitalOcean](https://m.do.co/c/6b4b1bf0f63e)

## Social Profiles

[Medium](https://medium.com/@imusabkhan) |
[YouTube](https://www.youtube.com/musabkhan) |
[LinkedIn](https://www.linkedin.com/in/musab1995/) |
[Twitter](https://twitter.com/Musab1995) |
[HackerOne](https://hackerone.com/musabkhan) |
[Facebook](https://facebook.com/imusabkhan) |
[Instagram](https://instagram.com/imusabkhan)
