//
//  UserDisconnectedViewController.swift
//  SpotifyApp
//
//  Created by Edmilson vieira da silva on 13/07/20.
//  Copyright © 2020 Edmilson vieira da silva. All rights reserved.
//

import UIKit
import AVKit
class UserDisconnectedViewController: UIViewController, UserDisconnectedInterface {
    
    var eventHandler: UserDisconnectedModuleInterface?/////// referencia pra presenter
    var player: AVPlayer!  /////  declara um tocador
    let bgView = UIView() ///  container de fundo
    
    let btnCreateAccount: SPTButton = {
        let btn = SPTButton()
        btn.setTitle("CREATE ACCOUNT", buttonColor: UIButtonColor.primary)
        btn.addTarget(self, action: #selector(createAccountDidTapped), for: .touchUpInside)
        return btn
    }()
    
    let btnLogin: SPTButton = {
        let btn = SPTButton()
        btn.setTitle("LOG IN", buttonColor: UIButtonColor.secondary)
        //btn.addTarget(self, action: #selector(loginDidTapped), for: .touchUpInside)
         btn.addTarget(self, action: #selector(loginDidTapped), for: .touchUpInside)
        return btn
    }()
    
    let alreadyAUser: SPTLabel = {
        let lbl = SPTLabel()
        lbl.text = "Already a user?"
        return lbl
    }()
    ///// page control
    let pageControl : UIPageControl = {
        let p = UIPageControl()
        p.numberOfPages = 5
        return p
    }()
    
    let collectionHighlight: HighlightCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cl = HighlightCollectionView(frame: .zero, collectionViewLayout: layout)
        cl.backgroundColor = .clear
        return cl
        
    }()
    let  logo: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "6274-spotify-logo-horizontal-white-rgb") /// imagem do logo
        iv.contentMode = .scaleAspectFit /// preenche
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(btnCreateAccount)
        view.addSubview(btnLogin)
        view.addSubview(alreadyAUser)
        view.addSubview(pageControl) //// adicionado nesse commit
        view.addSubview(collectionHighlight)//// adicionado nesse commit
        view.addSubview(logo)//// adicionado nesse commit
        view.addSubview(bgView)//// adicionado nesse commit
        view.sendSubviewToBack(bgView)
        
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: btnCreateAccount)
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: btnLogin)
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: alreadyAUser)
        view.constraint(pattern: "H:|-32-[v0]-32-|", views: pageControl)
        view.constraint(pattern: "H:|-64-[v0]-64-|", views: logo)
        view.constraint(pattern: "H:|[v0]|", views: collectionHighlight)
        view.constraint(pattern: "H:|[v0]|", views: bgView  )
        
        view.constraint(pattern: "V:|[v0][v1(100)]-32-[v2]-32-[v3]-12-[v4(10)]-3-[v5]-36-|", views:logo,collectionHighlight,pageControl, btnCreateAccount, alreadyAUser, btnLogin)
        view.constraint(pattern: "V:|[v0]|", views: bgView)
        ////configurar a seta  a seta de back da navigationbar 
        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "ic_keyboard_arrow_left_white")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "ic_keyboard_arrow_left_white")
        
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        eventHandler?.showHighlightMessage()  ////ligacao do view commo preventer  chamado o funcao especifica
        //// notification center escuta   observa a situacaoa descrita no name e dexecuta um selector
       NotificationCenter.default.addObserver(self,
                                                     selector: #selector(playerItemDidReachEnd(notification:)),
                                                     name: Notification.Name.AVPlayerItemDidPlayToEndTime,
                                                     object: player?.currentItem)
    }
    /*viewDidLoadé chamado exatamente uma vez, quando o controlador de exibição é carregado pela primeira vez na memória. É aqui que você deseja instanciar quaisquer variáveis ​​de instância e criar quaisquer visualizações que permaneçam durante todo o ciclo de vida desse controlador de visualização. No entanto, a visualização geralmente ainda não é visível neste momento.

    viewDidAppearé chamado quando a visualização é realmente visível e pode ser chamado várias vezes durante o ciclo de vida de um View Controller (por exemplo, quando um Modal View Controller é descartado e a visualização se torna visível novamente). É aqui que você deseja executar ações de layout ou desenhar na interface do usuário - por exemplo, apresentando um controlador de vista modal. No entanto, qualquer coisa que você faça aqui deve ser repetível. É melhor não guardar as coisas aqui, caso contrário você terá vazamentos de memória se não liberá-los quando a exibição desaparecer.

    Consulte: https://developer.apple.com/documentation/uikit/uiviewcontroller*/
    
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
          ///  para funcionar  corretamente p file path o arquivo precisa ser dadicionadao no bundle do projetoClique no seu projeto
         /*
         1-Clique no seu alvo
          2-Selecione Fases de construção
          3-Expanda Recursos do pacote de cópias
          4-Clique em '+' e selecione seu arquivo. */
        
        let filePath = Bundle.main.path(forResource: "intro", ofType: "mp4")!
          let videoURL = URL(fileURLWithPath: filePath)
          
          if player == nil {
              player = AVPlayer(url: videoURL)
              let playerLayer = AVPlayerLayer(player: player)
              playerLayer.videoGravity = .resizeAspectFill
              
              playerLayer.frame = bgView.bounds
              bgView.layer.addSublayer(playerLayer)
              
              player.play()
          }
          
          
      }
    
    @objc func playerItemDidReachEnd(notification: Notification){
        if let  playerItem : AVPlayerItem =  notification.object as? AVPlayerItem{
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
            player.play()
        }
        
    }
    
    @objc func createAccountDidTapped() {
        eventHandler?.createAccountAction()
    }
    
    @objc func loginDidTapped() {
        eventHandler?.loginAction()
    }
    /// recebe os dados  e os repassa para a a collectionview
    func show(responses: [(String, String)]) {
        collectionHighlight.response = responses
        print(responses)
    }

}
