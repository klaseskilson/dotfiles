import sublime_plugin
class StatusBar(sublime_plugin.EventListener):
    def on_activated_async(self, view):
        if view.is_read_only():
            Status = "ReadOnly"
        else:
            Status = "Full"
        view.set_status('encoding', view.encoding())
        view.set_status('currentPath', view.file_name())
        view.set_status('lineending', view.line_endings())
        view.set_status('readonly', Status)
