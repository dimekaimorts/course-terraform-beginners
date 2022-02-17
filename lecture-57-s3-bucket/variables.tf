
variable "credentials_lucy" {
  type        = map(string)
  description = "Credentials used for lucy user"
  default     = null
}

variable "project_region" {
  type = string
}
