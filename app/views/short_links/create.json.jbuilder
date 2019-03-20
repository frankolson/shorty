json.long_url   @short_link_form.short_link.long_url
json.short_link shortened_url(@short_link_form.short_link.short_code)
json.created_by @short_link_form.short_link.user.username
json.company    @short_link_form.short_link.company.name
