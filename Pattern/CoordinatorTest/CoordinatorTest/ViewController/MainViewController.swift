//
//  MainViewController.swift
//  CoordinatorTest
//
//  Created by 전민수 on 11/15/23.
//

import UIKit

class MainViewController: UIViewController {
    private let redButton: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.addTarget(self, action: #selector(redTap), for: .touchUpInside)
        
        return button
    }()
    private let blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Blue", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(blueTap), for: .touchUpInside)
        
        return button
    }()
    private let segmentedControl: UISegmentedControl = {
        let seg = UISegmentedControl()
        seg.backgroundColor = .green
        seg.insertSegment(withTitle: "Segment 1", at: 0, animated: false)
        seg.insertSegment(withTitle: "Segment 2", at: 1, animated: false)
        seg.selectedSegmentIndex = 0
        
        return seg
    }()
    
    weak var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureUI()
    }

    @objc func redTap() {
        coordinator?.goToRedVC()
    }
    
    @objc func blueTap() {
        coordinator?.goToBlueVC(to: segmentedControl.selectedSegmentIndex)
    }
    
    private func configureUI() {
        view.addSubview(redButton)
        view.addSubview(blueButton)
        view.addSubview(segmentedControl)
        
        redButton.translatesAutoresizingMaskIntoConstraints = false
        blueButton.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            redButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            redButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            blueButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            blueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
}

