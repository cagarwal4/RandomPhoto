//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Chethan Agarwal on 11/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        
        
        imageView.addSubview(button)
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    func getRandomPhoto() {
        let urlString = "https://picsum.photos/200"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return print("Error fetching data")
        }
        
        view.addSubview(button)
        button.frame = CGRect(x: 0, y: 300, width: 300, height: 50)
        imageView.image = UIImage(data: data)
    }
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemPink,
        .systemYellow
    ]
    
    @objc func didTapButton(){
        getRandomPhoto()
        
        view.backgroundColor = colors.randomElement()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 20, y: view.frame.size.height-150-view.safeAreaInsets.bottom, width: view.frame.size.width-40, height: 50)
    }
}
