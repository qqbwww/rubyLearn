require "gdbm"
require "csv"

module JZipCode
  ZIP_FILE = "01HOKKAI.CSV"
  DBFILE = "ken_all.db"
  COLUMN_ZIP = 2

  module_function

  def find(code)
    make_database(ZIP_FILE, DB_FILE)
    GDBM.open(DB_FILE, nil, GDBM::READER|GDBM::NOLOCK){|db|
      if line = db[code]
        return CSV.parse(line)
      end
    }
    return nil
  end

  def make_database(zipfile,dbfile)
    return if File.exist?(dbfile)
    open(zipfile){|io|
      GDBM.open(dbfile, 0644, GDBM::NEWDB){|db|
        io.each{|line|
          columns = line.split(",")
          zipcode = columns[COLUMN_ZIP].delete('"')
          if tmp = db[zipcode]
            line = tmp + line
          end
        }
        db[zipcode] = line
      }
    }
  end
end