set -e
set -eo pipefail



    cd 10_iac
    terraform init && terraform plan 
    if [ $? -ne 0 ]; then
        echo -e " There is some error in infrastructure as code."
        exit 1
    else
        terraform apply -auto-approve
    fi   
    cd ..
    echo -e "Stage ended."
done  
