 # Configure the provider

 provider "aws" {
   region  = var.region
   profile = "Terraform"
 }

 #create VPC

 module "VPC" {
   source                       =   "../modules/vpc"
   region                       =   var.region
   project_name                 =   var.project_name
   Environment                  =   var.Environment 
   vpc_cidr                     =   var.vpc_cidr
   pub_sub_az1-cidr             =   var.pub_sub_az1-cidr
   pub_sub_az2-cidr             =   var.pub_sub_az2-cidr
   private_app_sub_az1-cidr     =   var.private_app_sub_az1-cidr
   private_app_sub_az2-cidr     =   var.private_app_sub_az2-cidr
   private_data_sub_az1-cidr    =   var.private_data_sub_az1-cidr
   private_data_sub_az2-cidr    =   var.private_data_sub_az2-cidr

 }