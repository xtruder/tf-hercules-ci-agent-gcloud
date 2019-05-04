# Hercules CI agent gcloud terraform example

Just a simple example how to deploy hercules CI agent on google cloud using
terraform.

## Usage

### Setup google default application credentials

```
gcloud auth application-default login
```

### Initialize terraform dependencies

```
terraform init
```

### Deploy resources

```
terraform apply
```

terraform will ask you for hercules-ci agent token and google project name

### Destroy

```
terraform destroy
```

## License

MIT
