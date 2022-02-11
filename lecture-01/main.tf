resource "local_file" "games" {
  filename = "/${pwd}/favorite-games"
  content  = "FIFA 21"
}