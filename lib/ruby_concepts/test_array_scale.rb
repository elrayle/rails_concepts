class Array
  def move(from,to)
    insert(to, delete_at(from))
  end
end

def gen_list(max_items)
  items = []

  header_info = {}
  header_info[:uri]               = "http://localhost/list/acc1e0e4-5676-4594-833b-cca6ec6bf361"
  header_info[:first]             = "http://localhost/proxy/p1"
  header_info[:last]              = "http://localhost/proxy/p#{(max_items)}"
  header_info[:current]           = 6
  header_info[:last_loaded]       = max_items
  header_info[:count_loaded]      = max_items
  header_info[:resume_next_token] = nil
  header_info[:resume_prev_token] = nil
  header_info[:loaded_items]      = items

  0.upto(max_items) do |i|
    item_info = {}
    item_info[:uri]             = "http://localhost/proxy/p#{i}"
    item_info[:prev]            = i == 0 ? nil : "http://localhost/proxy/p#{(i-1)}"
    item_info[:next]            = i > max_items ? nil : "http://localhost/proxy/p#{(i+1)}"
    item_info[:proxyFor]        = "http://localhost/bibref/b#{i}"
    item_info[:proxyIn]         = "http://localhost/list/acc1e0e4-5676-4594-833b-cca6ec6bf361"
    item_info[:proxyIn_loaded]  = header_info

    items[i] = item_info
    # print "." if max_items <= 80 || i.modulo(max_items/80) == 0
  end
  header_info
end

def move_item(list,to,from)
  items = list[:loaded_items]

  return nil unless from >= 0 && from < items.size    ### TODO Give warning that list wasn't changed because from is too small or too big
  return nil unless to   >= 0 && to   < items.size    ### TODO Give warning that list wasn't changed because to is too small or too big

  items.move(to,from)

  # update from location links
  items[from+1][:prev] = items[from][:uri] unless from == (list[:loaded_items].size-1)
  items[from][:prev] = from == 0 ? nil : items[from-1][:uri]
  items[from][:next] = from == (list[:loaded_items].size-1) ? nil : items[from+1][:uri]
  items[from-1][:next] = items[from][:uri] unless from == 0

  # update to location links
  items[to+1][:prev] = items[to][:uri] unless to == (list[:loaded_items].size-1)
  items[to][:prev] = to == 0 ? nil : items[to-1][:uri]
  items[to][:next] = to == (list[:loaded_items].size-1) ? nil : items[to+1][:uri]
  items[to-1][:next] = items[to][:uri] unless to == 0

  nil
end

def insert_item(list,item,before)
  items = list[:loaded_items]

  return nil unless before >= 0 && before <= items.size    ### TODO Give warning that list wasn't changed because from is too small or too big

  items.insert(before,item)

  # update from location links
  items[before+1][:prev] = items[before][:uri] unless before == (items.size-1)
  items[before][:prev] = before == 0 ? nil : items[before-1][:uri]
  items[before][:next] = before == (items.size-1) ? nil : items[before+1][:uri]
  items[before-1][:next] = items[before][:uri] unless before == 0

  nil
end

def append_item(list,item)
  items = list[:loaded_items]
  items.insert(items.size,item)
  nil
end


def find_item_by_uri(list,uri)
  items = list[:loaded_items]
  0.upto(items.size-1) { |i| return i if items[i][:uri] == uri }
  nil
end

def destroy_list(list)
  # garbage collection does not seem to happen even with GC.start
  list[:loaded_items].clear
  list = nil
  GC.start
end

def find_random_items(list,num)
  items = list[:loaded_items]
  max = items.size
  t = 0
  1.upto(num) do |i|
    uri = "http://localhost/proxy/p#{rand(max)}"
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    idx = find_item_by_uri(list,uri)
    t_end = Time.now.to_i
    # ret_time[:array_create] = t_end - t_start
    puts("random_find[#{i}] for #{max}: #{t_end-t_start} sec -- URI: #{uri} -- POS: #{idx}")
    t += t_end - t_start
  end
  avg = t/num
  puts("random_find avg for #{max}: #{avg}")
  avg
end

def test_at_scale(max_items, array_test=false, list_test=false)
  ret_time = {}

  if array_test
    # simple array create test
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    a = []
    a.fill(0,max_items) {|i| ++i }
#    a.fill(0,max_items) {|i| ++i; print "." if max_items <= 80 || i.modulo(max_items/80) == 0 }
    t_end = Time.now.to_i
    ret_time[:array_create] = t_end - t_start
    puts("\narray_create for #{max_items}: #{t_end-t_start} sec")

    # simple array move test
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    a.move(max_items-2,1); print "."
    t_end = Time.now.to_i
    ret_time[:array_move] = t_end - t_start
    puts("\narray_move for #{max_items}: #{t_end-t_start} sec")

    # garbage collection does not seem to happen even with GC.start
    a.clear
    a = nil
    GC.start
  end

  if list_test
    # list create test
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    l = gen_list(max_items)
    t_end = Time.now.to_i
    ret_time[:list_create] = t_end - t_start
    puts("\nlist_create for #{max_items}: #{t_end-t_start} sec")

    # list move item test - from near end of list to near beginning of list
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    move_item(l,max_items-2,1); print "."
    t_end = Time.now.to_i
    ret_time[:list_move] = t_end - t_start
    puts("\nlist_move for #{max_items}: #{t_end-t_start} sec")

    # list insert item test - near beginning of list
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    insert_item(l,l[:loaded_items][0],1); print "."
    t_end = Time.now.to_i
    ret_time[:list_insert] = t_end - t_start
    puts("\nlist_insert for #{max_items}: #{t_end-t_start} sec")

    # list append item test
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    append_item(l,l[:loaded_items][0]); print "."
    t_end = Time.now.to_i
    ret_time[:list_append] = t_end - t_start
    puts("\nlist_append for #{max_items}: #{t_end-t_start} sec")

    # find last item by uri
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    idx = find_item_by_uri(l,"http://localhost/proxy/p#{max_items-1}"); print "."
    t_end = Time.now.to_i
    ret_time[:list_find] = t_end - t_start
    puts("\nlist_find for #{max_items}: #{t_end-t_start} sec found - position=#{idx}")

    # find item by non-existent uri
    t_start = 0
    t_end   = 0
    t_start = Time.now.to_i
    idx = find_item_by_uri(l,"MISSING"); print "."
    t_end = Time.now.to_i
    ret_time[:list_find] = t_end - t_start
    puts("\nlist_find for #{max_items}: #{t_end-t_start} sec NOT found - position=#{idx}")

    # find items by random uri
    avg = find_random_items(l,[max_items,200].min)
    ret_time[:rand_find] = avg
    puts("\nrand_find for #{max_items}: #{avg} sec on average")

    # garbage collection does not seem to happen even with GC.start
    destroy_list(l)
  end

  ret_time
end


tl_10            = test_at_scale(10,false,true)
tl_100           = test_at_scale(100,false,true)
tl_1_000         = test_at_scale(1000,false,true)
tl_10_000        = test_at_scale(10000,false,true)
tl_100_000       = test_at_scale(100000,false,true)
tl_500_000       = test_at_scale(500000,false,true)
tl_1_000_000     = test_at_scale(1000000,false,true)
tl_2_000_000     = test_at_scale(2000000,false,true)
tl_4_000_000     = test_at_scale(4000000,false,true)
tl_8_000_000     = test_at_scale(8000000,false,true)
tl_10_000_000    = test_at_scale(10000000,false,true)
tl_20_000_000    = test_at_scale(20000000,false,true)
tl_40_000_000    = test_at_scale(40000000,false,true)
tl_80_000_000    = test_at_scale(80000000,false,true)
tl_100_000_000   = test_at_scale(100000000,false,true)

ta_10            = test_at_scale(10,true,false)
ta_100           = test_at_scale(100,true,false)
ta_1_000         = test_at_scale(1000,true,false)
ta_10_000        = test_at_scale(10000,true,false)
ta_100_000       = test_at_scale(100000,true,false)
ta_500_000       = test_at_scale(500000,true,false)
ta_1_000_000     = test_at_scale(1000000,true,false)
ta_2_000_000     = test_at_scale(2000000,true,false)
ta_4_000_000     = test_at_scale(4000000,true,false)
ta_8_000_000     = test_at_scale(8000000,true,false)
ta_10_000_000    = test_at_scale(10000000,true,false)
ta_20_000_000    = test_at_scale(20000000,true,false)
ta_40_000_000    = test_at_scale(40000000,true,false)
ta_80_000_000    = test_at_scale(80000000,true,false)
ta_100_000_000   = test_at_scale(100000000,true,false)






# RESULTS
# ---------------------------------------------------
# Time to array_create            10:   0 sec
# Time to array_create           100:   0 sec
# Time to array_create         1,000:   0 sec
# Time to array_create        10,000:   0 sec
# Time to array_create       100,000:   0 sec
# Time to array_create       500,000:   0 sec
# Time to array_create     1,000,000:   0 sec
# Time to array_create     2,000,000:   0 sec
# Time to array_create     4,000,000:   0 sec
# Time to array_create     8,000,000:   0 sec
# Time to array_create    10,000,000:   3 sec
# Time to array_create   100,000,000:  15 sec
# ---------------------------------------------------
# Time to array_move              10:   0 sec
# Time to array_move             100:   0 sec
# Time to array_move           1,000:   0 sec
# Time to array_move          10,000:   0 sec
# Time to array_move         100,000:   0 sec
# Time to array_move         500,000:   0 sec
# Time to array_move       1,000,000:   0 sec
# Time to array_move       2,000,000:   0 sec
# Time to array_move       4,000,000:   0 sec
# Time to array_move       8,000,000:   0 sec
# Time to array_move      10,000,000:   0 sec
# Time to array_move     100,000,000:   0 sec
# ---------------------------------------------------
# Time to list_create             10:   0 sec  MEMORY -  no increase
# Time to list_create            100:   0 sec  MEMORY -  no increase
# Time to list_create          1,000:   0 sec  MEMORY -  no increase
# Time to list_create         10,000:   0 sec  MEMORY -  no increase
# Time to list_create        100,000:   0 sec  MEMORY -  0.05
# Time to list_create        500,000:   3 sec  MEMORY -  0.38
# Time to list_create      1,000,000:   6 sec  MEMORY -  1.16 = 5.67 - 4.51
# Time to list_create      2,000,000:  25 sec  MEMORY -  2.34 = 6.85 - 4.51
# Time to list_create      4,000,000:  80 sec  MEMORY -  6.62 = 11.13 - 4.51
# Time to list_create      8,000,000: 290 sec  MEMORY -  9.24 = 13.75 - 4.51
# Time to list_create     10,000,000: 447 sec  MEMORY - 11.24 = 15.97 - 4.51
# Time to list_create    100,000,000: OUT OF MEMORY - 16 GB
# ---------------------------------------------------
# Time to list_move               10:   0 sec
# Time to list_move              100:   0 sec
# Time to list_move            1,000:   0 sec
# Time to list_move           10,000:   0 sec
# Time to list_move          100,000:   0 sec
# Time to list_move          500,000:   0 sec
# Time to list_move        1,000,000:   0 sec
# Time to list_move        2,000,000:   0 sec
# Time to list_move        4,000,000:   0 sec
# Time to list_move        8,000,000:   0 sec
# Time to list_move       10,000,000:   0 sec
# Time to list_move      100,000,000: UNABLE TO CREATE LIST
# ---------------------------------------------------

