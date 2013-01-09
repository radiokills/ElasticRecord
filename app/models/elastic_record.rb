class ElasticRecord




	def initialize(hsh)
		@hash_store=hsh
		hsh.each do |k,v|
			define_singleton_method k do 
				@hash_store[k]
			end

			define_singleton_method "#{k}=" do |val|
				@hash_store[k]=val
			end

		end
	end

	def method_missing(meth, *args)
		if meth.to_s[-1] == "="
			method_name=meth.to_s[0..-2]
			@hash_store[method_name.to_sym]=args[0]
			define_singleton_method method_name do
				args[0]
			end
		elsif @hash_store[args[0]]
				return "nekek"
		else
			super
		end
	end

	def to_h
		return @hash_store
	end

	def to_json
		@hash_store.to_json
	end

end