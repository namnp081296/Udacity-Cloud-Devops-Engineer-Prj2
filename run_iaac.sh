#!/bin/bash
# This is the automation script for Deploying CloudFormation templates Infrastructure. 

################ Parameters Explanation ################
# $1: Run mode. Valid values: create, update and delete.
# $2: Your target region you want to deploy the infra.
# $3: Name of the Cloudformation stack.
# $4: Name of the Template file.
# $5: Name of the Parameters file.
########################################################

###################  Usage examples: ###################
# ./run.sh create <your-region> <stack-name> <template-file>.yml <params-file>.json
# ./run.sh update <your-region> <stack-name> <template-file>.yml <params-file>.json
# ./run.sh delete <your-region> <stack-name>
########################################################

# Validation commandline parameters
if [[ $1 != "create" && $1 != "update" && $1 != "delete" ]]; then
    echo "ERROR: Please declare your Run Mode. Valid values: creat, update or delete." >&2
    exit 1
fi

# Declare Command Parameters For Running
RUN_MODE=$1
REGION=$2
STACK_NAME=$3
TEMPLATE_FILE=$4
PARAMETERS_FILE=$5

# Execution Part
if [ $RUN_MODE == "create" ]
then
    aws cloudformation create-stack --stack-name $STACK_NAME \
        --template-body file://$TEMPLATE_FILE   \
        --parameters file://$PARAMETERS_FILE  \
        --capabilities "CAPABILITY_NAMED_IAM"  \
        --region=us-east-1
fi

if [ $RUN_MODE == "update" ]
then
    aws cloudformation update-stack \
        --stack-name $STACK_NAME \
        --template-body file://$TEMPLATE_FILE \
        --parameters file://$PARAMETERS_FILE \
        --capabilities "CAPABILITY_NAMED_IAM" \
        --region=$REGION
fi

if [ $RUN_MODE == "delete" ]
then
    aws cloudformation delete-stack \
        --stack-name $STACK_NAME \
        --region=$REGION
fi
