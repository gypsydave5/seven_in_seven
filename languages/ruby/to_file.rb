module ToFile

  def filename
    "object_#{self.object_id}.txt"
  end

  def to_f
    File.open(filename, "w") {|file| file.write(to_s) }
  end

end

