
variable "credentials" {
  type        = map(string)
  description = "Credentials used for lucy user"
  default     = null
}

variable "project_region" {
  type = string
}

variable "webserver_ami_ubuntu" {
    type = string
}

variable "path_home" {
    type = string
}
