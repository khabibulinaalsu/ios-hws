/* import UIKit

extension NotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let note = dataSource[indexPath.row]
        if let noteCell = tableView.dequeueReusableCell(withIdentifier: NoteCell.reuseIdentifier, for: indexPath) as? NoteCell {
            noteCell.configure(note)
            return noteCell
        }
    }
    return UITableViewCell()
    }
}
extension NotesViewController: UITableViewDelegate { }
*/
