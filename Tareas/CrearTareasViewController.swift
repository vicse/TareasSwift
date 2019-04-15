import UIKit

class CrearTareasViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtNombreTarea: UITextField!
    @IBOutlet weak var swImportante: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func agregar(_ sender: Any){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let tarea = Tarea(context: context)
        tarea.nombre = txtNombreTarea.text!
        tarea.importante = swImportante.isOn
        
        
        navigationController!.popViewController(animated: true)
    }
    
}
