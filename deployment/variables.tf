variable "public_key" {
  description = "Public SSH key you want to bake into the instance."
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDfGyQ8i+YLqo9X3bOE00CRz1JTBXSrYFoP+9YNzxPDuAJ/FYnFUUC5GabPozgsD8ePS3aQmZlGuXjyT3Y8/45i/88eNEAEbJq6xt3HPjhiNGN98J3dmIa5OlsZ6ZCEZfO47tF3g5t507i8dq31NMuPladtKbo5xQ4ksaK4lZFlzv2xysn+EabLWQWtsaNj7eG/2S50yDTQYuiVBjzbIVE4AF7M2FT1KuxYQ8yExGufeYDehNINdjAVmvQGWRttkk0BH+P5cyGHxBGAifY76xxS6bKz0hpg9mPJ6Y2aKyeKva/TOxKsFO3FI2zdynppo/WoFSwKZ615l6x6G+a5yxKCniT20Bm619azDu3094iD2tpDpIFaPvdewgJ0b507hd44f9pbiiKD5ClUgiUbpX87wIM7gBY/MZi7BXt66xpP8aqcysO8olh9cjPoxmykP7Zk6k8YZaSc/luo8XhowOOxnWhhYtNkl2cmIBbO8zykL5/M+jgv3hol8XYaW4HYazEnGk7H2ppv5blPpLGAmgc6AHf81TqWpggQNT1TWvqtGp7FScI8KZhWeS1E76sei/Btk2ha47ML6JCkcknIj07dhdKsni7+n0zTc73ajc++R/Ft9xWcT59gkAjyxchT/wMSTrvhb7xKtMvqd2V1tjjTrEFYcBTlXWsSCHakbWFMkQ== halbard@pop-os"
}

variable "private_key_path" {
  description = "Path to the private SSH key, used to access the instance."
  default     = "~/.ssh/my_aws"
}