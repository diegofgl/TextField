# TextField

## Descrição do Código

Este é um exemplo de código em Swift para uma tela de entrada de CPF (Cadastro de Pessoa Física) em um aplicativo iOS. A classe `HomeVC` é uma UIViewController que gerencia a interface do usuário e a validação do CPF à medida que o usuário o digita. Aqui estão algumas das principais funcionalidades:

- O campo de texto `cpfTextField` permite que o usuário insira seu CPF, e é formatado automaticamente à medida que o usuário digita.
- A etiqueta `errorLabel` exibe feedback visual ao usuário sobre a validade do CPF inserido.
- A classe `HomeVC` também atua como o delegado (`UITextFieldDelegate`) do campo de texto, permitindo personalizar o comportamento do campo de texto durante a entrada do CPF.
- O método `shouldChangeCharactersIn` é usado para validar e formatar o CPF em tempo real à medida que o usuário digita.
- Quando um CPF válido é inserido, a etiqueta `errorLabel` fica verde e exibe "CPF válido!", caso contrário, fica vermelha e exibe "CPF inválido".

Este código pode ser útil como um exemplo de como usar delegados de campo de texto e validar/formatar entrada de texto em tempo real em um aplicativo iOS.

<span style="color: red">Nota</span> Este é um exemplo simplificado e não aborda todas as regras de validação de CPF.


https://github.com/diegofgl/TextField/assets/122054408/bc0effc9-e234-4cee-953d-6957b2a3d8f1


