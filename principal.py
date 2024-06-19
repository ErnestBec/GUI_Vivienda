#from PyQt5 import QtCore, QtGui, QtWidgets
import sys
from PyQt5.QtWidgets import QApplication, QMainWindow
from PyQt5 import QtCore, QtGui, QtWidgets

class MainWindow(QMainWindow):
    #Empleado,Oficio_Empleado, Oficio, Vivienda
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Ventana Principal")
        self.btn_empleado = QtWidgets.QPushButton("Empleado",self)
        self.btn_oficio_emp = QtWidgets.QPushButton("Oficio_Empleado",self)
        self.btn_oficio = QtWidgets.QPushButton("Oficio",self)
        self.btn_vivienda = QtWidgets.QPushButton("Vivienda",self)

        layout = QtWidgets.QVBoxLayout()
        layout.addWidget(self.btn_empleado)
        layout.addWidget(self.btn_oficio_emp)
        layout.addWidget(self.btn_oficio)
        layout.addWidget(self.btn_vivienda)

        container = QtWidgets.QWidget()
        container.setLayout(layout)
        self.setCentralWidget(container)


        self.setGeometry(100, 100, 600, 400)

def main():
    app = QApplication(sys.argv)
    window = MainWindow()
    window.show()
    sys.exit(app.exec_())

if __name__ == "__main__":
    main()
