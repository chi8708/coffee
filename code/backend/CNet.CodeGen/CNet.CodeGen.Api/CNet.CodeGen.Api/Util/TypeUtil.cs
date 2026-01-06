namespace CNet.CodeGen.Api.Util
{
    public static class TypeUtil
    {
        public static string CSharpTypeToTypeScript(string csharpType)
        {
            switch (csharpType)
            {
                case "int":
                case "long":
                case "short":
                case "float":
                case "double":
                case "decimal":
                    return "number";
                case "string":
                case "char":
                    return "string";
                case "bool":
                case "Boolean":
                    return "boolean";
                case "DateTime":
                    return "Date";
                case "object":
                    return "any";
                case "void":
                    return "void";
                case "byte":
                case "sbyte":
                case "uint":
                case "ulong":
                case "ushort":
                    return "number";
                default:
                    return "any";
            }
        }
    }
}
