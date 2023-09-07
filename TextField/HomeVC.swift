//
//  ViewController.swift
//  TextField
//
//  Created by Diego Rodrigues on 16/08/23.
//

import UIKit
//delegates - permite que personalize o comportamento de acordo com as necessidades.
class HomeVC: UIViewController, UITextFieldDelegate {//Aqui eu permito personalizar o comportamento do campo de texto
    
    lazy var cpfTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Digite seu CPF"
        textField.keyboardType = .numberPad
        textField.backgroundColor = .white
        return textField
    }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        
        cpfTextField.delegate = self //aqui eu estabeleço uma comunicaçao entre a class HomeVC e campo de texto cpfTextField, defino como o HomeVC como delegadoi do campo de texto, permitindo que que personalize o comportamento do campo de texto.
    }
    
    func setupViews() {
        view.addSubview(cpfTextField)
        view.addSubview(errorLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            cpfTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cpfTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cpfTextField.widthAnchor.constraint(equalToConstant: 300),
            cpfTextField.heightAnchor.constraint(equalToConstant: 40),
            
            errorLabel.topAnchor.constraint(equalTo: cpfTextField.bottomAnchor, constant: 8),
            errorLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    //shouldChangeCharactersIn - um metodo do UITextFieldDelegate,e é chamado sempre que o texto no campo de texto esta para mudar, ele permite que voce valide e formate o texto  enquanto o usuario digite.
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange, with: string)
            
            let digits = updatedText.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
            
            if digits.count <= 11 {
                textField.text = formatCPF(digits)
                //o delegates tambem são usados fornecer feedback visual ao usuario.
                if digits.count == 11 {
                    errorLabel.textColor = .green
                    errorLabel.text = "CPF válido!"
                } else {
                    errorLabel.textColor = .red
                    errorLabel.text = "CPF inválido"
                    }
                }
                
                return false
            }
            
            return true
        }
        //para usar a mascara de cpf, eu chamo ele dentro do metodo shouldChangeCharactersIn para garantir qur o cpf seja formatado corretamente enquanto digita
            func formatCPF(_ cpf: String) -> String {
                var formattedCPF = ""
                var index = cpf.startIndex
                
                for i in 0..<cpf.count {
                    if i == 3 || i == 6 {//adicionei ponto no dps 3 e 6, dps do 9 traço
                        formattedCPF += "."
                    } else if i == 9 {
                        formattedCPF += "-"
                    }
                    
                    let nextIndex = cpf.index(after: index)
                    formattedCPF += String(cpf[index..<nextIndex])//serve para extrair um caractere do cpf e adiciona-lo na string formatada.
                    index = nextIndex
                }
                
                return formattedCPF
            }
        }

