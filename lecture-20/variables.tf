
# List variable
// Each value can be referenced by the number or index in that list
variable "prefix" {
    default = ["Mr", "Mrs", "Sir"]
    type    = list
}

# Map variable
variable "file-content" {
    type = map
    default = {
        "key1" = "We love pets"
        "key2" = "We love animals"
    }
}

variable "ex1" {
    default = ["MX", "BR", "US"]
    type    = list(string) 
}

variable "ex2" {
    default = [1,2,3,4]
    type    = list(number) 
}

variable "cats" {
    type = map(string)
    description = "(optional) describe your variable"
    default = {
        color = "brown"
        name = "shady"
    }
}

variable "pet_count" {
    type = map(number)
    description = "(optional) describe your variable"
    default = {
        dogs = 2
        cats = 4
        goldfish = 1
    }
}

# Set
variable "setA" {
  type        = set(string)
  default     = ["CDMX", "MTY", "GDL"]
}

variable "fruits" {
  type        = set(string)
  default     = ["apple", "banana"]
}

variable "age" {
    type = set(number)
    default = [33,25,46]
}


# Objects
variable "person" {
    type = object({
        name  = string
        color = string
        age   = number
        food  = list(string)
        favorite_pet = bool
    })

    default = {
      age = 25
      color = "blue"
      favorite_pet = true
      food = [ "chicken", "fish" ]
      name = "Bella"
    }
}


# Tuple
variable "kitty" {
    type = tuple([string, number, bool])
    default = ["dog", 1, false]
}