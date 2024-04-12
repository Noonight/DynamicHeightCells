//
//  ViewController.swift
//  DynamicHeightCells
//
//  Created by Aiur Arkhipov on 12.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var dataSource: [(UIImage, String)] = [
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Number title"),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнительd обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Number title"),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Number title"),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Number title"),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Number title"),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
        (UIImage(systemName: "multiply.circle.fill")!, "Number title"),
        (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнитель обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах."),
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.tableView.register(DynamicHeightCell.self, forCellReuseIdentifier: "cellID")
        self.tableView.estimatedRowHeight = 40
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        
        view = tableView
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.tableView.beginUpdates()
            self.dataSource[1] = (UIImage(systemName: "multiply.circle.fill")!, "Lorem Ipsum является текст-заполнительas обычно используется в графических, печать и издательской индустрии для предварительного просмотра макета и визуальных макетах.")
            self.tableView.endUpdates()
            self.tableView.reloadRows(at: [.init(row: 1, section: 0)], with: .automatic)
        }
    }
}

extension ViewController: UITableViewDelegate {
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as? DynamicHeightCell
        else { return UITableViewCell() }
        cell.setup(image: dataSource[indexPath.row].0, text: dataSource[indexPath.row].1)
        return cell
    }
}

