require 'rest-client'
require 'json'

class Ready
  attr_accessor :link 
  def initialize(link)
    @link = link
  end

  def transfor
    response = RestClient.get(link)
    @json = JSON.parse(response)
    @json
  end


  def array(json)
    @notices = Array.new
    @json["data"]["children"].each do |notice|
      new_notice = {}
      new_notice["Titulo"] = notice["data"]["title"]
      new_notice["Autor"] = notice["data"]["author"]
      new_notice["Link"] = notice["data"]["url"]
      new_notice["Fecha"] = notice["data"]["created"]
      @notices.push(new_notice)
    end
    @notices
  end

  def time(array)
    (0..array.length-1).each do |position|
    new_date = Time.at(array[position]["Fecha"])
    new_date = new_date.strftime("%d /%m /%y")
    array[position]["Fecha"] = new_date
    end
    array
  end

  def array_order(array)
    date = 0 
    (0..array.length-2).each do |i|
      (0..array.length-1).each do |j|
        if array[i]["Fecha"] < array[j]["Fecha"]
          date = array[j]
          array[j] = array[i]
          array[i] = date
        end
      end
    end
    array
  end
end

notice_rabit = Ready.new("https://www.reddit.com/.json")
arreglo = notice_rabit.array(notice_rabit.transfor)
time = notice_rabit.time(arreglo)
notice_rabit.array_order(time)
