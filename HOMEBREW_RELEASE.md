# Homebrew Release Process

Documentación para actualizar la herramienta restore en Homebrew.

## Repositorios

- **Main**: `git@github.com:LucasZNK/restore.git` - La herramienta
- **Tap**: `git@github.com:LucasZNK/homebrew-restore.git` - Formula de Homebrew

## Proceso para nueva versión

### 1. Hacer cambios y commitear
```bash
# En el repo principal
git add .
git commit -m "[SAVE #N] Descripción de cambios"
git push
```

### 2. Crear release
```bash
# Desde el repo principal
gh release create v1.X.X --title "v1.X.X - Descripción" --notes "Descripción de cambios"
```

### 3. Generar nuevo SHA256
```bash
curl -sL https://github.com/LucasZNK/restore/archive/refs/tags/v1.X.X.tar.gz | shasum -a 256
```

### 4. Actualizar formula
```bash
# Ir al repo del tap
cd homebrew-restore

# Editar restore.rb:
# - Cambiar version en la URL
# - Actualizar SHA256 con el hash del paso anterior

# Commitear y pushear
git add restore.rb
git commit -m "Update to v1.X.X"
git push
```

## Estructura de la formula

```ruby
class Restore < Formula
  desc "Interactive Git save point browser"
  homepage "https://github.com/LucasZNK/restore"
  url "https://github.com/LucasZNK/restore/archive/refs/tags/v1.X.X.tar.gz"  # <- Cambiar versión
  sha256 "NUEVO_HASH_AQUI"  # <- Cambiar SHA256
  license "MIT"

  def install
    bin.install "restore"
  end

  test do
    assert_predicate bin/"restore", :exist?
    assert_predicate bin/"restore", :executable?
  end
end
```

## Comandos de prueba

### Instalar
```bash
brew tap LucasZNK/restore
brew install restore
```

### Actualizar
```bash
brew update
brew upgrade restore
```

### Desinstalar
```bash
brew uninstall restore
brew untap LucasZNK/restore
```

## Troubleshooting

### Error de SHA256
Si Homebrew reporta error de SHA256, regenerar el hash:
```bash
curl -sL https://github.com/LucasZNK/restore/archive/refs/tags/vX.X.X.tar.gz | shasum -a 256
```

### Cachear formula
```bash
brew uninstall restore
brew untap LucasZNK/restore
brew tap LucasZNK/restore
brew install restore
```