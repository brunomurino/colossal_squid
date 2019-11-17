# Colossal Squid

* Create GCP account
* Create service-account with editor permissions and download the JSON
* Create bucket to store terraform state
* Enable versioning on bucket

After you install gcloud, run the following command to authenticate your terminal session (https://cloud.google.com/sdk/gcloud/reference/auth/activate-service-account):

```gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS```

Then, run the following command to enable versioning on your terraform state bucket (https://cloud.google.com/storage/docs/using-object-versioning):

```gsutil versioning set on gs://colossal-squid-terraform-state-prod```