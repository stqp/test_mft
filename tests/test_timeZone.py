import unittest
from mac_ripper.modules.plist.timezone import TimeZone


class TestTimeZone(unittest.TestCase):

    def test_parse_timezone(self):
        evidence_root = '/'
        self.time_zone = TimeZone(evidence_root)
        result = self.time_zone.parse_timezone()
        self.assertEqual(result, "Asia/Tokyo")

    def test_file_not_found(self):
        evidence_root = '/hoge'
        self.time_zone = TimeZone(evidence_root)
        self.assertRaises(ValueError, lambda: self.time_zone.parse_timezone())

