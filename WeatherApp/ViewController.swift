//
//  SceneDelegate.swift
//  hidekeyboard
//
//  Created by Apple on 18.12.2020.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weatherIconImageView: UIImageView!

    @IBOutlet weak var cityLabel: UILabel!

    @IBOutlet weak var temperaturelabel: UILabel!
    
    @IBOutlet weak var feelsLikeTemperature: UILabel!
    
    var networkWeather = WeatherNetworkManager()
    
    

    @IBAction func alert(_ sender: UIButton) {

        let alertcontroller = UIAlertController( title: title, message: "Enter the city", preferredStyle: .alert)

        let search = UIAlertAction(title: "Search", style: .default) { (action) in
            let textFieldCity = alertcontroller.textFields?.first
            guard let city = textFieldCity?.text else {return}
            if city != "" {
                self.networkWeather.getCurrentWeather(forCity: city)
                print(city)
            }
        }
        
        alertcontroller.addTextField { (textField) in
            textField.placeholder = "Moscow, Ufa, Minsk"
        }

        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertcontroller.addAction(search)
        alertcontroller.addAction(cancel)
        present(alertcontroller, animated: true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        networkWeather.onConplition = { CurrentWeather in
            self.updateInterface(weather: CurrentWeather)
            print(CurrentWeather.cityName)
        }
        networkWeather.getCurrentWeather(forCity: "Balashikha")
        
    }
    func updateInterface(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.cityLabel.text = weather.cityName
            self.temperaturelabel.text = " " + weather.temperatureString + " ℃"
            self.feelsLikeTemperature.text = "     Feels like: " + weather.feelslikeTemperatureString + " ℃"
            self.weatherIconImageView.image = UIImage(systemName: weather.systemIconNameString)
        }
        
    }

}


