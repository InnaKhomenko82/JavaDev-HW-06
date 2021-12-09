package ua.goit.util;

import com.google.gson.Gson;

import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.Optional;
import java.util.Scanner;

public class HandleBodyUtil {
    private static Gson jsonParser = new Gson();

    public static <T> Optional<T> getModelFromStream(InputStream in, Class<T> returnType) {
        InputStream inputStream = in;
        Scanner scanner = new Scanner(inputStream, StandardCharsets.UTF_8.name());
        String jsonStr = scanner.nextLine();
        return Optional.of(jsonParser.fromJson(jsonStr, returnType));
    }
}