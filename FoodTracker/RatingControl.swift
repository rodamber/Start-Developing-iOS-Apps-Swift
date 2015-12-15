import UIKit

class RatingControl: UIView {

    // MARK: Properties
    
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    
    var ratingButtons = [UIButton]()
    
    let spacing = 5
    let stars = 5
    
    // MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage  = UIImage(named: "emptyStar")
        
        for _ in 0..<stars {
            let buttonSize = Int(frame.size.height)
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize))

            button.setImage(emptyStarImage,  forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])

            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)

            ratingButtons.append(button)
            addSubview(button)
        }
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (i,b) in ratingButtons.enumerate() {
            b.frame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
            b.frame.origin.x = CGFloat(i * (buttonSize + spacing))
        }
        updateSelectionStates()
    }
    
    override func intrinsicContentSize() -> CGSize {
        let height = Int(frame.size.height)
        let width  = (height + spacing) * stars
        return CGSize(width: width, height: height)
    }

    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateSelectionStates()
    }
    
    func updateSelectionStates() {
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
}
