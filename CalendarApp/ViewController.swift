
import UIKit

class ViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource{

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var selectedDate = Date()
    var totalSquares = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setCellsView()
        setMonthView()
    }
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    func setMonthView()
    {
    
        totalSquares.removeAll()
        let daysInMonth = CalendarHelperr().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelperr().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelperr().weekDay(date: firstDayOfMonth)
        
        
        var count : Int = 1
        while(count <= 42)
        {
        
            if(count <= startingSpaces || count - startingSpaces >  daysInMonth)
            {
                totalSquares.append("")
            }
            else
            {
                totalSquares.append(String(count - startingSpaces))
                
            }
            count += 1
        }
        
        monthLabel.text = CalendarHelperr().monthString(date: selectedDate)
        + " " + CalendarHelperr().yearString(date: selectedDate)
        collectionView.reloadData()
                
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        cell.dayOfMonth.text = totalSquares[indexPath.item]
        return cell
        
        
        
    }

    @IBAction func previousMonth(_ sender: UIButton) {
        selectedDate = CalendarHelperr().minsMonth(date: selectedDate)
        setMonthView()
    }
    
    @IBAction func nextMonth(_ sender: UIButton) {
        selectedDate = CalendarHelperr().plusMonth(date: selectedDate)
        setMonthView()
    }
}

