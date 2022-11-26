import UIKit

final class AddNoteCell: UITableViewCell {
    static let reuseIdentifier = "AddNoteCell"
    private var textView = UITextView()
    public var addButton = UIButton(type: .system)
    
    weak var delegate: AddNoteDelegate?
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setupView()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        textView.font = .systemFont(ofSize: 16, weight: .regular)
        textView.textColor = .gray
        textView.backgroundColor = .clear
        textView.heightAnchor.constraint(equalToConstant: 128).isActive = true
        textView.layer.cornerRadius = 12
        addButton.setTitle("Add new note", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        addButton.setTitleColor(.systemBackground, for: .normal)
        addButton.backgroundColor = .systemGray2
        addButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.addTarget(self, action: #selector(addButtonTapped(_:)), for: .touchUpInside)
        addButton.isEnabled = true
        addButton.alpha = 0.5
        let stackView = UIStackView(arrangedSubviews: [textView, addButton])
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.distribution = .fill
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentView.backgroundColor = .systemGray6
    }
    
    @objc
    private func addButtonTapped(_ sender: UIButton) {
        delegate?.newNoteAdded(note: ShortNote(text: textView.text))
        textView.text = nil
    }
}
