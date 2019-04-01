import os
import sys
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    os.environ["QT_QUICK_CONTROLS_STYLE"] = "Material"
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    ctx = engine.rootContext()
    engine.load("view.qml")
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())