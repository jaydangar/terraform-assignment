variable "is_prod" {
  description = "Used to determine if this is a prod environment"
  type = bool
}

variable "user_data_path" {
  description = "Provides user data path for setting up the server"
  type = string
}