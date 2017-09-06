//
//  ViewController.swift
//  ios-acedrawingview-demo
//
//  Created by OkuderaYuki on 2017/09/06.
//  Copyright © 2017年 YukiOkudera. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - properties

    @IBOutlet weak var drawingView: ACEDrawingView!
    
    // 255, 255, 204
    private let backgroundColor: CGColor = #colorLiteral(red: 1, green: 1, blue: 0.8, alpha: 1).cgColor
    // 0, 0, 255
    private let borderColor: CGColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1).cgColor
    private let borderWidth: CGFloat = 5.0
    private let penLineWidth: CGFloat = 3.0
    private let eraserLineWidth: CGFloat = 15.0
    
    // MARK: - view life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDrawingView()
    }
    
    // MARK: - private
    private func setupDrawingView() {
        drawingView.layer.backgroundColor = backgroundColor
        drawingView.layer.borderWidth = borderWidth
        drawingView.layer.borderColor = borderColor
        drawingView.lineWidth = penLineWidth
    }
    
    // MARK: actions
    
    @IBAction func didTapPen(_ sender: UIButton) {
        drawingView.drawTool = ACEDrawingToolTypePen
        drawingView.lineWidth = penLineWidth
    }
    
    @IBAction func didTapEraser(_ sender: UIButton) {
        drawingView.drawTool = ACEDrawingToolTypeEraser
        drawingView.lineWidth = eraserLineWidth
    }
    
    @IBAction private func didTapSave(_ sender: UIButton) {
        if let capture = Capture.take(view: drawingView, rect: drawingView.frame) {
            Capture.save(image: capture)
        }
    }
}

