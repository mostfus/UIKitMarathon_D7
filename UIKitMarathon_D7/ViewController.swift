//
//  ViewController.swift
//  UIKitMarathon_D7
//
//  Created by Maksim Vaselkov on 21.02.2024.
//

import UIKit

class ViewController: UIViewController {

    private enum Const {
        static let defaultImageHeight: CGFloat = 270.0
    }

    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()

        view.delegate = self
        view.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2)

        return view
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageS")
        return imageView
    }()

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrollView.frame = view.bounds
        imageView.frame = CGRect(
            x: .zero,
            y: -scrollView.safeAreaInsets.top,
            width: scrollView.frame.width,
            height: Const.defaultImageHeight
        )
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }


}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y + scrollView.safeAreaInsets.top

        if y < 0 {
            imageView.frame = CGRect(x: .zero, y: -scrollView.safeAreaInsets.top + y, width: scrollView.frame.width, height: Const.defaultImageHeight + abs(y))
        }

        scrollView.verticalScrollIndicatorInsets.top = imageView.frame.height - scrollView.safeAreaInsets.top
    }
}
