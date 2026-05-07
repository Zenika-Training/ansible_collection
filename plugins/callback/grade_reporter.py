from __future__ import annotations
from ansible.plugins.callback import CallbackBase
from ansible import constants as C


class CallbackModule(CallbackBase):
    CALLBACK_VERSION = 2.0
    CALLBACK_TYPE = 'stdout'
    CALLBACK_NAME = 'grade_reporter'
    CALLBACK_NEEDS_ENABLED = False

    def v2_playbook_on_play_start(self, play):
        pass

    def v2_playbook_on_task_start(self, task, is_conditional):
        pass

    def _display_grade_msg(self, result):
        if result._task.action in ('ansible.builtin.debug', 'debug'):
            msg = result._result.get('msg', '')
            if isinstance(msg, str):
                if msg.startswith('[OK]'):
                    color = C.COLOR_OK
                elif msg.startswith('[KO]'):
                    color = C.COLOR_ERROR
                else:
                    color = C.COLOR_VERBOSE
                self._display.display(msg, color=color)

    def v2_runner_on_ok(self, result):
        self._display_grade_msg(result)

    def v2_runner_item_on_ok(self, result):
        self._display_grade_msg(result)

    def v2_runner_on_skipped(self, result):
        pass

    def v2_runner_on_unreachable(self, result):
        host = result._host.get_name()
        self._display.display(f'UNREACHABLE: {host}', color=C.COLOR_UNREACHABLE)

    def v2_runner_on_failed(self, result, ignore_errors=False):
        if not ignore_errors:
            msg = result._result.get('msg', 'Task failed')
            self._display.display(f'FAILED: {msg}', color=C.COLOR_ERROR)

    def v2_playbook_on_stats(self, stats):
        pass
