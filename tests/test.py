from kivy.app import App
from kivy.uix.widget import Widget


class MainWindow(Widget):
    pass


class HelloWorldApp(App):
    def build(self):
        return MainWindow()


if __name__ == '__main__':
    HelloWorldApp().run()