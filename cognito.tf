resource "aws_cognito_user_pool" "grupo36_pool" {
  name = "grupo36_pool"

  auto_verified_attributes = ["email"]

  admin_create_user_config {
        allow_admin_create_user_only    = true
    }

  email_configuration {
    email_sending_account               = "COGNITO_DEFAULT"
  }

  verification_message_template {
    default_email_option                = "CONFIRM_WITH_LINK"
    email_message_by_link               = "Olá! {##Clique aqui##} para confirmar a criação da sua conta. Depois da confirmação, você terá acesso a aplicação usando seu usuário e senha pessoal!"
    email_subject_by_link               = "FIAP restaurante"
  }

  #username_attributes = ["email"]
  alias_attributes = ["preferred_username"]

  password_policy {
    minimum_length                      = 8
    password_history_size               = 0
    require_lowercase                   = false
    require_symbols                     = false
    require_uppercase                   = false
  }
}

resource "aws_cognito_user_pool_domain" "customer" {
  domain                                = "grupo36-fiap"
  user_pool_id                          = aws_cognito_user_pool.grupo36_pool.id
}

resource "aws_cognito_user_pool_client" "customerpool_client" {
  name                                 = "customer"
  user_pool_id                         = aws_cognito_user_pool.grupo36_pool.id
  callback_urls                        = ["https://example.com"]
  explicit_auth_flows                   = ["USER_PASSWORD_AUTH"]
  generate_secret                       = false
}
