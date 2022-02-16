    //
    //  ViewController.swift
    //  newsAppTest
    //
    //  Created by my macbook on 13/2/22.
    //


    import UIKit
    import SnapKit
    import Kingfisher


    class ViewController: UIViewController {

    private lazy var newsTableView: UITableView = {
    let view = UITableView()
    view.delegate = self
    view.dataSource = self
    view.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
    return view
    }()

    private var news: [NewsModul] = []

    override func viewDidLoad() {
    super.viewDidLoad()
        title = "Новости"
        navigationController?.navigationBar.prefersLargeTitles = true
    addNews()

    view.addSubview(newsTableView)
    newsTableView.snp.makeConstraints { make in
        make.edges.equalToSuperview()
    }

    }

    func addNews(){
    news.append(NewsModul("На утро 16 февраля выявлены 54 новых случая COVID-19","«Здоровье» (АКИpress) — На утро 16 февраля в Кыргызстане выявлены 54 новых случая заражения коронавирусной инфекцией, сообщает Республиканский штаб по борьбе с COVID-19. \n Из них: \n - Бишкек – 25,- Жалал-Абадская область – 10,- Чуйская область – 9,- Иссык-Кульская область – 6,- Город Ош – 2,- Таласская область – 2,- Нарынская область – 0,- Ошская область – 0,- Баткенская область – 0.За весь период зарегистрированы 200 175 случаев коронавируса.За сутки скончались 3 человека", "https://st-0.akipress.org/st_gallery/70/1311170.c02af997ed803076645fa2ea18ab11f1.jpg"))
    news.append(NewsModul("22-летнюю подозреваемую в мошенничестве водворили в СИЗО-1","«Сводка» (АКИpress) – 22-летнюю подозреваемую в мошенничестве Н.Н. водворили в СИЗО-1, сообщили редакции «Сводка АКИpress» в пресс-службе Первомайского районного суда.Она будет находиться в следственном изоляторе до 22 февраля.Девушка подозревается в том, что 17 января взяла iPhone 12 Pro Max позвонить, но телефон так и не вернула. Данный факт зарегистрирован в ЕРП по ст.209 («Мошенничество») УК КР.Подробнее: svodka.akipress.org/news:1763052?f=cp", "https://st-0.akipress.org/st_gallery/99/1308399.4b7a78264d9128f7fee97c5d139f475c.jpg"))
    news.append(NewsModul("Резюме директора Департамента транспорта и развития дорожно-транспортной инфраструктуры Максата Нусувалиева","Бишкек (АКИpress) – Нусувалиев Максат Орозбекович 28 января был назначен директором Департамента транспорта и развития дорожно-транспортной инфраструктуры мэрии Бишкека.", "https://play-lh.googleusercontent.com/aCyq5_tBBCKcD5f4yuiE3kaNc1HDbPLA7Tq7PoEqBk1RVODSqJQUYpB_ekCrW23qnhw"))
    newsTableView.reloadData()
                          }
               }
    extension ViewController:  UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return news.count ?? 0
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 150
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = newsTableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
            let model = news[indexPath.row]
            cell.fill(model: model)
            return cell
        }
        
        
    }
                          
