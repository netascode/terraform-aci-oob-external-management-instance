variable "name" {
  description = "OOB external management instance name."
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z0-9_.-]{0,64}$", var.name))
    error_message = "Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}

variable "subnets" {
  description = "Subnets"
  type        = list(string)
  default     = []
}

variable "oob_contracts" {
  description = "OOB Contracts"
  type = object({
    consumers = optional(list(string))
  })
  default = {}

  validation {
    condition = alltrue([
      for prov in coalesce(var.oob_contracts.consumers, []) : can(regex("^[a-zA-Z0-9_.-]{0,64}$", prov))
    ])
    error_message = "`consumers`: Allowed characters: `a`-`z`, `A`-`Z`, `0`-`9`, `_`, `.`, `-`. Maximum characters: 64."
  }
}
