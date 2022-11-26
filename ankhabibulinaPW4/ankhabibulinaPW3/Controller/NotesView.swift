import UIKit

final class NotesViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    //private var dataSource = [ShortNote]()
    private var dataSource = [
        ShortNote(text: "1")]

    private let label = UILabel()
    let labelView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupView()
    }
    
    private func setupView() {
        setupTableView()
        setupNavBar()
    }
    private func setupTableView() {
        tableView.register(AddNoteCell.self, forCellReuseIdentifier: AddNoteCell.reuseIdentifier)
        tableView.register(NoteCell.self, forCellReuseIdentifier: NoteCell.reuseIdentifier)
        tableView.backgroundColor = .clear
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 24).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    private func setupNavBar() {
        view.addSubview(labelView)
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        labelView.heightAnchor.constraint(equalToConstant: 48).isActive = true
        labelView.backgroundColor = .white
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        label.text = "Notes"
        label.font = .systemFont(ofSize: 24.0, weight: .regular)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        let closeButton = UIButton(type: .close)
        labelView.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.widthAnchor.constraint(equalTo: closeButton.heightAnchor).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
    }
    private func handleDelete(indexPath: IndexPath) {
        if indexPath.section != 0 {
            dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @objc
    private func dismissViewController(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension NotesViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return dataSource.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let addNewCell = tableView.dequeueReusableCell(withIdentifier: AddNoteCell.reuseIdentifier, for: indexPath) as? AddNoteCell {
                addNewCell.delegate = self
                return addNewCell
            }
        default:
            let note = dataSource[indexPath.row]
            if let noteCell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath) as? NoteCell {
                noteCell.configure(note)
                return noteCell
            }
        }
        return UITableViewCell()
    }
}


extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if indexPath.section == 0 {
            return nil
        }
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: .none
        ) { [weak self] (action, view, completion) in self?.handleDelete(indexPath: indexPath)
            completion(true)
        }
        deleteAction.image = UIImage(
            systemName: "trash.fill",
            withConfiguration: UIImage.SymbolConfiguration(weight: .bold)
        )?.withTintColor(.white)
        deleteAction.backgroundColor = UIColor(red: 0.78, green: 0.5, blue: 0.5, alpha: 1)
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

protocol AddNoteDelegate: AnyObject {
    func newNoteAdded(note: ShortNote)
}

extension NotesViewController: AddNoteDelegate {
    func newNoteAdded(note: ShortNote) {
        dataSource.insert(note, at: 0)
        tableView.reloadData()
    }
}
