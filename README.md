# aws-challenge

Hi, this is the challenge to deploy a simple APi app to a Lambda function and consume it via api gateway within AWS. Here you have a brief description of the tools I use.

Terraform: Deploys the Lambda Function and the API Gateway.

Github Actions: To update the content of the app.

The steps to make it work are the following:

1. Install Terraform in your machine, here you have a link to the installation guide https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli.

2. Install aws cli in your machine, here you have a link to the installation guide https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html.

3. Configure the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY (This you will need to generate them with your AWS USER).https://docs.aws.amazon.com/keyspaces/latest/devguide/access.credentials.html

    Once that you get your credentials, you can configure them in your machine with the command "aws configure" That is going to prompt you to enter the values of the variables so you can keep them in your machine. You need to configure it as well in the Secrets of Github so the workflow don't crash. https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions

4. Now that you are set with that you can navigate to the /terraform file and type the following comands:

    - terraform init #This command install the dependencies needed to deploy the infra
    - terraform plan #This command will give you a detailed view of what is going to be created.
    - terraform apply #This command is going to created everything that you saw in the terraform plan.

5. Once that you see that everything is created, it will show you the output of the invoke URL, the route key and the name of the lambda function. example:

    URL https://$something.execute-api.us-east-1.amazonaws.com/lambdastage
    ROUTE_KEY ANY /lambdaapi
    LAMBDA_FUNCTION lambdaapi

    With this you can join the URL with the ROUTE_KEY to see the content of the API, like this:
        https://$somehting.execute-api.us-east-1.amazonaws.com/lambdastage/lambdaapi

And that's all, now you can change the code in the api_publico.py file to try it and github workflows will automatically update it for you in the lambda function.