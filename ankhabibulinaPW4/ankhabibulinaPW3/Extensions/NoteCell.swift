import UIKit

final class NoteCell: UITableViewCell {
    static let reuseIdentifier = "NoteCell"
    private var textlabel = UILabel()
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    private func setupView() {
        textlabel.font = .systemFont(ofSize: 16, weight: .regular)
        textlabel.textColor = .label
        textlabel.numberOfLines = 0
        textlabel.backgroundColor = .clear
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(textlabel)
        textlabel.translatesAutoresizingMaskIntoConstraints = false
        textlabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        textlabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16).isActive = true
        textlabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        textlabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
    }
    public func configure(_ note: ShortNote) {
        textlabel.text = note.text
    }
}
