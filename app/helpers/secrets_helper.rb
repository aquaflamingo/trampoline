module SecretsHelper
  def pretty_vendors_list
    Secret.vendors.values.map do |v|
      [
        Secret::Vendor.decorated_name(v.to_sym),
        v
      ]
    end
  end
end
