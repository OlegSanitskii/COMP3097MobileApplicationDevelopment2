import UIKit

class ViewController: UIViewController {

    private var value = 0
    private var step = 2

    private let logoImageView = UIImageView()
    private let valueLabel = UILabel()
    private let minusButton = UIButton(type: .system)
    private let plusButton = UIButton(type: .system)
    private let resetButton = UIButton(type: .system)
    private let stepButton = UIButton(type: .system)
    private let warningLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupLogo()
        setupValueLabel()
        setupButtons()
        setupWarningLabel()
        setupLayout()
        updateValueLabel()
        updateStepButton()
    }

    private func setupView() {
        view.backgroundColor = UIColor(red: 237/255, green: 219/255, blue: 143/255, alpha: 1.0)
    }

    private func setupLogo() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gbc_logo")
        logoImageView.contentMode = .scaleAspectFit
        view.addSubview(logoImageView)
    }

    private func setupValueLabel() {
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.font = UIFont.systemFont(ofSize: 34)
        valueLabel.backgroundColor = .white
        valueLabel.layer.cornerRadius = 5
        valueLabel.layer.masksToBounds = true
        view.addSubview(valueLabel)
    }

    private func setupButtons() {
        setupButton(minusButton, title: "-", backgroundColor: UIColor.gray.withAlphaComponent(0.6), titleColor: .black)
        setupButton(plusButton, title: "+", backgroundColor: UIColor.gray.withAlphaComponent(0.6), titleColor: .black)
        setupButton(resetButton, title: "Reset", backgroundColor: .systemGreen, titleColor: .white)
        setupButton(stepButton, title: "Step = 2", backgroundColor: .systemOrange, titleColor: .white)

        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)

        minusButton.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        stepButton.addTarget(self, action: #selector(stepTapped), for: .touchUpInside)

        view.addSubview(minusButton)
        view.addSubview(plusButton)
        view.addSubview(resetButton)
        view.addSubview(stepButton)
    }

    private func setupButton(_ button: UIButton, title: String, backgroundColor: UIColor, titleColor: UIColor) {
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
    }

    private func setupWarningLabel() {
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        warningLabel.textAlignment = .center
        warningLabel.font = UIFont.boldSystemFont(ofSize: 18)
        warningLabel.textColor = .white
        warningLabel.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        warningLabel.layer.cornerRadius = 10
        warningLabel.layer.masksToBounds = true
        warningLabel.alpha = 0
        view.addSubview(warningLabel)
    }

    private func setupLayout() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 26),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 130),
            logoImageView.heightAnchor.constraint(equalToConstant: 80),

            valueLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
            valueLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            valueLabel.widthAnchor.constraint(equalToConstant: 150),
            valueLabel.heightAnchor.constraint(equalToConstant: 50),

            minusButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 40),
            minusButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            minusButton.widthAnchor.constraint(equalToConstant: 90),
            minusButton.heightAnchor.constraint(equalToConstant: 45),

            plusButton.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 40),
            plusButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            plusButton.widthAnchor.constraint(equalToConstant: 90),
            plusButton.heightAnchor.constraint(equalToConstant: 45),

            resetButton.topAnchor.constraint(equalTo: minusButton.bottomAnchor, constant: 25),
            resetButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -15),
            resetButton.widthAnchor.constraint(equalToConstant: 90),
            resetButton.heightAnchor.constraint(equalToConstant: 45),

            stepButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 25),
            stepButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 15),
            stepButton.widthAnchor.constraint(equalToConstant: 110),
            stepButton.heightAnchor.constraint(equalToConstant: 45),

            warningLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 76),
            warningLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            warningLabel.widthAnchor.constraint(equalToConstant: 160),
            warningLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func updateValueLabel() {
        valueLabel.text = "\(value)"
    }

    private func updateStepButton() {
        stepButton.setTitle("Step = \(step)", for: .normal)
    }

    private func showWarning(message: String) {
        warningLabel.text = message

        UIView.animate(withDuration: 0.3) {
            self.warningLabel.alpha = 1
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            UIView.animate(withDuration: 0.3) {
                self.warningLabel.alpha = 0
            }
        }
    }

    @objc private func minusTapped() {
        value -= step
        updateValueLabel()
    }

    @objc private func plusTapped() {
        value += step
        updateValueLabel()
    }

    @objc private func resetTapped() {
        value = 0
        updateValueLabel()
    }

    @objc private func stepTapped() {
        step = (step == 1) ? 2 : 1
        updateStepButton()
        showWarning(message: "Step is \(step)")
    }
}
