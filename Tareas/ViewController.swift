//
//  ViewController.swift
//  Tareas
//
//  Created by vicse on 2/04/19.
//  Copyright © 2019 tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    var tareas:[Tarea] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tareas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell()
        let tarea = tareas[indexPath.row]
        if tarea.importante{
            cell.textLabel?.text = "😱\(tarea.nombre!)"
        }else{
            cell.textLabel?.text = tarea.nombre!
        }
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerTareas()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let tarea = tareas[indexPath.row]
        performSegue(withIdentifier: "tareaSeleccionadaSegue", sender: tarea)
    }
    
    @IBAction func agregarTarea(_ sender: Any){
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerTareas(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            tareas = try context.fetch(Tarea.fetchRequest()) as! [Tarea]
        } catch{
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "tareaSeleccionadaSegue" {
            let siguienteVC = segue.destination as! TareaCompletadaViewController
            siguienteVC.tarea = sender as! Tarea
            
        }
        
    }
    
}

