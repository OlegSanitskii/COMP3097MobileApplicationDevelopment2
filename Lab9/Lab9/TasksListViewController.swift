import UIKit
import CoreData

class TasksListViewController: UIViewController {

    private let tableView = UITableView()
    private var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Tasks List"
        view.backgroundColor = .systemBackground

        setupTableView()
        fetchTasks()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchTasks()
    }

    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TaskCell")

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    private func fetchTasks() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Task> = Task.fetchRequest()

        do {
            tasks = try context.fetch(request)
            tableView.reloadData()
        } catch {
            print("Failed to fetch tasks: \(error)")
        }
    }

    private func deleteTask(at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let context = appDelegate.persistentContainer.viewContext
        let taskToDelete = tasks[indexPath.row]

        context.delete(taskToDelete)

        do {
            try context.save()
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Failed to delete task: \(error)")
        }
    }

    private func editTask(at indexPath: IndexPath) {
        let task = tasks[indexPath.row]

        let alert = UIAlertController(title: "Edit Task",
                                      message: "Enter new task text",
                                      preferredStyle: .alert)

        alert.addTextField { textField in
            textField.text = task.title
            textField.placeholder = "Task name"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default) { _ in
            guard let newText = alert.textFields?.first?.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                  !newText.isEmpty else {
                return
            }

            self.updateTask(task: task, newTitle: newText)
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        alert.addAction(saveAction)
        alert.addAction(cancelAction)

        present(alert, animated: true)
    }

    private func updateTask(task: Task, newTitle: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }

        let context = appDelegate.persistentContainer.viewContext
        task.title = newTitle

        do {
            try context.save()
            fetchTasks()
        } catch {
            print("Failed to update task: \(error)")
        }
    }
}

extension TasksListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, completionHandler in
            self.deleteTask(at: indexPath)
            completionHandler(true)
        }

        let editAction = UIContextualAction(style: .normal, title: "Edit") { _, _, completionHandler in
            self.editTask(at: indexPath)
            completionHandler(true)
        }

        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}
