-- Cierra solo los pares: ( ) [ ] { } " ' etc.
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "hrsh7th/nvim-cmp" },
  config = function()
    require("nvim-autopairs").setup({ check_ts = true })
    -- Integración con el autocompletado (cmp): añade () al aceptar una función
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      cmp.event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done())
    end
  end,
}
