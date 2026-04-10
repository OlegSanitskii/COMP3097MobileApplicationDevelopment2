import UIKit
import CoreData

class ViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "To-Do List"
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let studentLabel: UILabel = {
        let label = UILabel()
        label.text = "Oleg Sanitskii - 101466133"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let taskTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter task"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private let addTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Task", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let viewTasksButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View Tasks", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Add Task"
        view.backgroundColor = .systemBackground

        setupUI()
        setupActions()
    }

    private func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(studentLabel)
        view.addSubview(taskTextField)
        view.addSubview(addTaskButton)
        view.addSubview(viewTasksButton)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            studentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            studentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            studentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            taskTextField.topAnchor.constraint(equalTo: studentLabel.bottomAnchor, constant: 40),
            taskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            taskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            taskTextField.heightAnchor.constraint(equalToConstant: 44),

            addTaskButton.topAnchor.constraint(equalTo: taskTextField.bottomAnchor, constant: 24),
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTaskButton.heightAnchor.constraint(equalToConstant: 44),

            viewTasksButton.topAnchor.constraint(equalTo: addTaskButton.bottomAnchor, constant: 16),
            viewTasksButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewTasksButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupActions() {
        addTaskButton.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
        viewTasksButton.addTarget(self, action: #selector(viewTasksButtonTapped), for: .touchUpInside)
    }

    @objc private func addTaskButtonTapped() {
        guard let taskText = taskTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              !taskText.isEmpty else {
            showAlert(title: "Error", message: "Please enter a task.")
            return
        }

        saveTask(title: taskText)
        taskTextField.text = ""
        showAlert(title: "Success", message: "Task added successfully.")
    }

    @objc private func viewTasksButtonTapped() {
        let tasksVC = TasksListViewController()
        navigationController?.pushViewController(tasksVC, animated: true)
    }

    private func saveTask(title: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let context = appDelegate.persistentContainer.viewContext
        let task = Task(context: context)
        task.title = title

        do {
            try context.save()
        } catch {
            print("Failed to save task: \(error)")
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
