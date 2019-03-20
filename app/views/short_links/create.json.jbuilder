json.long_url   @short_link_form.long_url
json.short_link shortened_url(@short_link_form.short_code)
json.created_by @short_link_form.user.username
json.company    @short_link_form.company.name
