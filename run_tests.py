"""Run the course's Nose tests on Python 3.10/3.11."""
import collections
import collections.abc
import nose

# Nose 1.3.7 predates the relocation of these ABCs in Python 3.10.
collections.Callable = collections.abc.Callable
nose.main(module=None, defaultTest=[
    "tests.test_models", "tests.test_routes", "tests.test_cli_commands"
])
